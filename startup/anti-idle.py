from asyncio import sleep

async def continuous_print():
    while True:
        print("I am awake!!")
        sleep(600)
    return False
continuous_print()
