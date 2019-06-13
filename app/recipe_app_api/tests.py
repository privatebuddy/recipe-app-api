from django.test import TestCase

from app.recipe_app_api.calc import add


class CalcTests(TestCase):

    def test_add_number(self):
        self.assertEqual(add(3, 8), 11)
