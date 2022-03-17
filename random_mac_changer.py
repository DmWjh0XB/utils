import subprocess
from random import randint

# TODO: handling the cannot assign the requested address
# TODO: handling parameter to chose the interface card

if __name__ == "__main__":
    """
        Change the mac address of the interface provided
    """

    random_mac = ":".join([(str(hex(randint(0, 255)))[2:]).zfill(2) for x in range(6)])

    commands = [
        "sudo ifconfig eth0 down",
        f"sudo ifconfig eth0 hw ether {random_mac}",
        "sudo ifconfig eth0 up"
    ]

    for line in commands:
        subprocess.run(line.split(" "))
