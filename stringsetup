# This script generates string session, which is needed for CatUserbot authorization.

import os
from telethon.sync import TelegramClient
from telethon.sessions import StringSession

def generate_string_session():
    print("""
Please go to my.telegram.org and login using your Telegram account.
Click on API Development Tools and create a new application by entering the required details. \
Skip if done already.
Get the 'App api_id' and 'App api_hash'.
API_ID is api_id and API_HASH is api_hash. Write them down below when prompted.
    """)

    Positive_Response = ("Y", "YES", "TRUE")
    Negative_Response = ("N", "NO", "FALSE")

    def response():
        for i in range(3):
            Response = (input("\nDo you want to send the String Session "
            "to your Telegram Saved Messages?(Yes, No) >> ")).upper().replace("'", "")

            if Response in Positive_Response:
                SM = True
                print("\nAlright! The String Session will be sent to your Telegram Saved Messages.\n")
                break
            elif Response in Negative_Response:
                SM = False
                print("\nIt's Okay. The String Session will not be sent to your Saved Messages.\n")
                break
            elif i < 2:
                print("Not sure of your response. Type 'Yes' or 'No'")
                SM = None

        if SM is None:
            print("\nCouldn't get a rational response. It was unexpected.\n")

        if not SM:
            for i in range(3):
                Response = (input("Do you want to print the String "
                        "Session here instead?(Yes, No) >> ")).upper().replace("'", "")

                if Response in Positive_Response:
                    print("\nAlright! The String Session will be printed here.\n")
                    TP = True
                    break
                elif Response in Negative_Response:
                    TP = False
                    break
                elif i < 2:
                    print("\nNot sure of your response. Type 'Yes' or 'No'\n")
                    TP = None

            if TP is None:
                print("\nYou might be confused. So the String Session will be printed here.\n")
                TP = True
                return False, True
            if TP is False:
                print("\nAlright. The String Session will not be generated."
                      " Closing String Session generator.")
                return False, False

        return True, False

    SavedMessage, TerminalPrint = response()
    if not SavedMessage and not TerminalPrint: return
    
    API_ID = os.environ.get("APP_ID", None)
    API_HASH = os.environ.get("API_HASH", None)
    
    got_info = False if API_ID is None or API_HASH is None else True
    if got_info is True:
        valid_info = input("The following values from your Environment Variables will be used.\n"
                           f"API_ID = {API_ID}\nAPI_HASH = {API_HASH}\n"
                           "To continue type 'Y'. To change the values type 'N': "
                          )
        got_info = True if str(valid_info).upper() in Positive_Response else False
    if got_info is False:
        API_ID = input("Please enter your API_ID: ")
        API_HASH = input("Please enter your API_HASH")

    with TelegramClient(StringSession(), API_ID, API_HASH) as client:
        string_session = client.session.save()

        if SavedMessage:
            client.send_message("me", string_session)
            client.send_message("me", "A not-an-unusual **Warning**:\n`Never share your String Session in any case.`")
            print("\nYour String Session has been generated successfully."
                  "It has been sent to your Telegram Saved Messages.")
            print("Remember, String Session is a very sensitive credential. Please do not share it.\n")

        if TerminalPrint:
            print("\nYour String Session is below:\n", string_session, "\n")
            print("Remember, String Session is a very sensitive credential. Please do not share it.\n")

    if not TerminalPrint:
        for i in range(3):
            Response = (input("Do you want to print the String"
                    "Session here as well?(Yes, No) >> ")).upper().replace("'", "")
            if Response in Positive_Response:
                print("\nYour String Session is below:\n\n", string_session, "\n")
                return print("\nRemember, String Session is a very sensitive credential. "
                             "Please do not share it.")
            elif Response in Negative_Response:
                return print("Sure. Closing the Terminal now. Have a nice day.")
            elif i < 2:
                print("Not sure of your response. Type 'Yes' or 'No'")

        print("\nNot a rational response still. Closing the String Session generator.")

generate_string_session()
