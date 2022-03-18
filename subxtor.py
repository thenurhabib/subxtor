

from logging import exception
import os

from pip import main

# colors
reset = '\033[0m'
bold = '\033[01m'
red = '\033[31m'
blue = '\033[34m'
cyan = '\033[36m'
yellow = '\033[93m'
orange = '\033[33m'

banner = print(f"""{yellow}{bold}
____ _  _ ___  _  _ ___ ____ ____ 
[__  |  | |__]  \/   |  |  | |__/ 
___] |__| |__] _/\_  |  |__| |  \ {reset}
                   {red}  @thenurhabib{reset}
=================================
               """)


def mainFunction():
    try:
        try:
            getDomainName = input(f"{blue}{bold}Enter Domain Name : " + cyan)
        except KeyboardInterrupt:
            print("Stopped.")
        print(f"{reset}{orange}")
        print("-"*30)
        os.system(f"bash ./main.sh {getDomainName}")
    except exception as error:
        print(f"Error Found : {error}")


if __name__ == "__main__":
    mainFunction()
