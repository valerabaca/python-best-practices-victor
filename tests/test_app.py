import unittest
from lundpy import app

class BasicTests(unittest.TestCase):

    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

    def test_main_page(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)

        expected_quotes = [
            "Code is like humor. When you have to explain it, it’s bad. - Cory House",
            "Fix the cause, not the symptom. - Steve Maguire",
            "Optimism is an occupational hazard of programming. - Kent Beck",
            "Simplicity is the soul of efficiency. - Austin Freeman"
        ]

        response_text = response.data.decode('utf-8')
        self.assertIn(response_text, expected_quotes)

if __name__ == "__main__":
    unittest.main()