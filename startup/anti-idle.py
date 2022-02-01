from asyncio import sleep
from logging import getLogger

async def continuous_logger():
    while True:
        getLogger("SleepCheck").info('I am awake!!')
        sleep(300)
    return False
await continuous_logger()
