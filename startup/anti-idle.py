import asyncio
from logging import getLogger

async def continuous_print():
    while True:
        getLogger("AliveCheck").info('I am Alive!!')
        await asyncio.sleep(300)
    return False

asyncio.run(continuous_print())
