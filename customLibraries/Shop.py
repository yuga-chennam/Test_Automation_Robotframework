from robot.api.deco import library,keyword
from robot.libraries.BuiltIn import BuiltIn


class Shop:

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def homepage(self):
        print("Welcome to home page")

    @keyword
    def get_price_of_selected_product(self, selected_product_name):
        [product_list] = self.selLib.get_webelements("xpath://div[@class='inventory_item_name']")
        index = 1

        for product in [product_list]:
            if product.text == selected_product_name:
                print(product.text)
                break
            index = index + 1

        element = self.selLib.get_webelement("xpath:(//div[@class='pricebar'])[Index]/div")
        product_price = element.text
        print(product_price," ",element.text)
        print(f"price of the selected product is {product_price}")










