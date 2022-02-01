from asyncio import time

async def continuous_print():
    while True:
        print("I am awake!!")
        time.sleep(600)
    return False
continuous_print()
