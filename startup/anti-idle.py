from asyncio import sleep

async def continuous_print():
    while True:
        print('I am Alive!!')
        sleep(300)
    return False
continuous_print()
