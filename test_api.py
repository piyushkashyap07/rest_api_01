# test_api.py

import httpx
from main import app

def test_read_root():
    async def perform_test():
        async with httpx.AsyncClient(app=app, base_url="http://testserver") as client:
            response = await client.get("/")
            assert response.status_code == 200
            assert response.json() == {"message": "Hello, World!"}

    import asyncio
    asyncio.run(perform_test())
