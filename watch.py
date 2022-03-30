#!/usr/bin/python3
import time
import requests
import logging
import sys

handler = logging.StreamHandler(sys.stdout)
handler.setFormatter(logging.Formatter("[%(asctime)s]: %(message)s"))
logging.getLogger().addHandler(handler)

def check():
    client = requests.Session()
    client.trust_env = False
    resp = client.get("http://127.0.0.1:8888/v1/chain/get_info").json()
    local_head = resp["head_block_num"]
    resp = client.get("https://wax.eoseoul.io/v1/chain/get_info").json()
    mainnet_head = resp["head_block_num"]
    diff = mainnet_head - local_head
    logging.info("local:{0} mainnet:{1} diff:{2}".format(local_head, mainnet_head, diff))
    if diff <= 2:
        logging.info("synchronization is complete")
        exit(0)


def main():
    while True:
        try:
            check()
        except Exception as e:
            logging.error(e)
        time.sleep(10)



if __name__ == '__main__':
    main()
