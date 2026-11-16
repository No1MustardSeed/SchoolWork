from city_functions import city_country

def test_city_country():
    result = city_country('santiago', 'chile')
    assert result == 'Santiago, Chile'

def test_city_country_second():
    result = city_country('paris', 'france')
    assert result == 'Paris, France'

from city_functions import city_country

def test_city_country():
    result = city_country('santiago', 'chile')
    assert result == 'Santiago, Chile'

def test_city_country_population():
    result = city_country('santiago', 'chile', 5000000)
    assert result == 'Santiago, Chile - Population 5000000'
