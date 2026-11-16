from assignment11 import Employee

def test_give_default_raise():
    employee = Employee('john', 'doe', 60000)
    employee.give_raise()
    assert employee.salary == 65000

def test_give_custom_raise():
    employee = Employee('john', 'doe', 60000)
    employee.give_raise(10000)
    assert employee.salary == 70000

import pytest
from assignment11 import Employee

@pytest.fixture
def employee():
    return Employee('john', 'doe', 60000)

def test_give_default_raise(employee):
    employee.give_raise()
    assert employee.salary == 65000

def test_give_custom_raise(employee):
    employee.give_raise(10000)
    assert employee.salary == 70000
