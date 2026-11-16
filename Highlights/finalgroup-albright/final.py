import pygame
import sys
import random

pygame.init()

# ---------------------------
# WINDOW SETTINGS
# ---------------------------
WIDTH = 800
HEIGHT = 600
WIN = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Spaceship Maze")
clock = pygame.time.Clock()

# ---------------------------
# COLORS
# ---------------------------
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
BLUE = (50, 120, 255)
RED = (255, 50, 50)
GREEN = (0, 200, 0)
YELLOW = (255, 255, 0)

# ---------------------------
# SPACESHIP SETTINGS
# ---------------------------
player_size = 30
player_speed = 4
player = pygame.Rect(50, HEIGHT // 2, player_size, player_size)


# ---------------------------
# BULLET SETTINGS
# ---------------------------
bullet_speed = 8
bullets = []

# ---------------------------
# ALIEN SETTINGS
# ---------------------------
ALIEN_SIZE = 28
ALIEN_SPEED = 2

# ---------------------------
# OBSTACLE SETTINGS
# ---------------------------
row_heights = [80, 160, 240, 320, 400]
row_speeds = [2, 3, 4, 5, 6]
row_delay = 90

# ---------------------------
# FINISH ZONE
# ---------------------------
finish_rect = pygame.Rect(WIDTH - 50, 0, 50, HEIGHT)

#alien
class Alien:
    def __init__(self, x, y, walls):
        self.walls = walls
        self.rect = pygame.Rect(x, y, ALIEN_SIZE, ALIEN_SIZE)
        self.speed = ALIEN_SPEED
        # pick a random starting direction
        self.direction = random.choice([(1,0), (-1,0), (0,1), (0,-1)])

        # try to load an image, if it fails draw a yellow box instead
        try:
            self.image = pygame.image.load("finalgroup/alien141.png")
            self.image = pygame.transform.scale(self.image, (ALIEN_SIZE, ALIEN_SIZE))
        except:
            self.image = pygame.Surface((ALIEN_SIZE, ALIEN_SIZE))
            self.image.fill(YELLOW)

    def wander(self):
        # move a little in current direction
        dx, dy = self.direction

        new_rect = self.rect.copy()
        new_rect.x += dx * self.speed
        new_rect.y += dy * self.speed

        # if it hits a wall OR goes off screen, change direction
        if any(new_rect.colliderect(wall) for wall in self.walls) or not (0 <= new_rect.x <= WIDTH and 0 <= new_rect.y <= HEIGHT):
            self.direction = random.choice([(1,0), (-1,0), (0,1), (0,-1)])
        else:
            self.rect = new_rect

    def draw(self, surface):
        surface.blit(self.image, self.rect)

# ---------------------------
# OBSTACLE CLASS
# ---------------------------
class Obstacle:
    def __init__(self, x, y, w, h, speed):
        self.rect = pygame.Rect(x, y, w, h)
        self.speed = speed

    def move(self):
        # move block sideways
        self.rect.x += self.speed

    def draw(self, surface):
        pygame.draw.rect(surface, RED, self.rect)

    def is_off_screen(self):
        return self.rect.left > WIDTH

# ---------------------------
# MAZE GENERATION
# ---------------------------
maze_walls = []
aliens = []


def generate_maze():
    global maze_walls, aliens
    maze_walls = []
    aliens = []

    # create random walls
    for i in range(10):
        # horizontal walls
        x = random.randint(100, 700)
        y = random.randint(50, 550)
        w = random.randint(100, 300)
        h = 20
        maze_walls.append(pygame.Rect(x, y, w, h))

        # vertical walls
        x = random.randint(100, 700)
        y = random.randint(50, 550)
        w = 20
        h = random.randint(100, 300)
        maze_walls.append(pygame.Rect(x, y, w, h))

    # spawn aliens safely
    tries = 0
    while len(aliens) < 5 and tries < 500:
        tries += 1
        x = random.randint(100, 700)
        y = random.randint(50, 550)
        a = Alien(x, y, maze_walls)

        if not any(a.rect.colliderect(w) for w in maze_walls):
            aliens.append(a)


generate_maze()

# ---------------------------
# OBSTACLE SETUP
# ---------------------------
obstacles = []
timer = 0
row_index = 0


def make_row(row_index):
    y = row_heights[row_index]
    speed = row_speeds[row_index]

    gap_width = random.randint(80, 150)
    gap_start = random.randint(50, WIDTH - 50 - gap_width)

    x_total = 0
    while x_total < WIDTH:
        block_width = random.randint(30, 100)
        if gap_start <= x_total <= gap_start + gap_width:
            x_total += block_width
            continue

        obstacles.append(Obstacle(-block_width, y, block_width, 20, speed))
        x_total += block_width

# ---------------------------
# DRAW FUNCTION
# ---------------------------

def draw_window():
    WIN.fill(BLACK)

    # draw maze walls
    for wall in maze_walls:
        pygame.draw.rect(WIN, BLUE, wall)

    # draw aliens
    for alien in aliens:
        alien.draw(WIN)

    # draw obstacles
    for obs in obstacles:
        obs.draw(WIN)

    # draw bullets
    for bullet in bullets:
        pygame.draw.rect(WIN, WHITE, bullet)

    # draw finish line
    pygame.draw.rect(WIN, GREEN, finish_rect)

    # draw player
    pygame.draw.rect(WIN, RED, player)

    pygame.display.update()

# ---------------------------
# MAIN GAME LOOP
# ---------------------------
running = True
while running:
    clock.tick(60)

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()

        # shoot bullet
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_SPACE:
                bullet = pygame.Rect(player.centerx - 2, player.top - 10, 4, 10)
                bullets.append(bullet)

    # ship movement
    keys = pygame.key.get_pressed()
    if keys[pygame.K_UP]:
        player.y -= player_speed
    if keys[pygame.K_DOWN]:
        player.y += player_speed
    if keys[pygame.K_LEFT]:
        player.x -= player_speed
    if keys[pygame.K_RIGHT]:
        player.x += player_speed

    # stop player from leaving screen
    player.clamp_ip(WIN.get_rect())

    # move aliens
    for alien in aliens:
        alien.wander()

    # move bullets
    for bullet in bullets[:]:
        bullet.y -= bullet_speed
        if bullet.bottom < 0:
            bullets.remove(bullet)

        for alien in aliens[:]:
            if bullet.colliderect(alien.rect):
                bullets.remove(bullet)
                aliens.remove(alien)

    # make obstacle rows
    timer += 1
    if timer >= row_delay:
        make_row(row_index)
        row_index = (row_index + 1) % len(row_heights)
        timer = 0

    # move obstacles
    for obs in obstacles[:]:
        obs.move()
        if obs.is_off_screen():
            obstacles.remove(obs)
        if obs.rect.colliderect(player):
            print("You hit an obstacle! Game Over")
            running = False

    # alien collision
    for alien in aliens:
        if alien.rect.colliderect(player):
            print("You ran into an alien! Game Over")
            running = False 

    if player.colliderect(finish_rect):
        print("New maze loaded!")
        player.x, player.y = 50, HEIGHT // 2
        bullets.clear()
        obstacles.clear()
        generate_maze()

    draw_window()


