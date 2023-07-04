

class RegisterNode:
    register_count = {0:0, 1:0, 2:0, 3:0, 4:0, 5:0, 6:0, 7:0, 8:0, 9:0, 10:0}
    """
    Generates a new node for a register number

    
    """
    def __init__(self, register_number):
        self.register_name = "r" + str(register_number)
    def __str__(self):
        return ""
class 