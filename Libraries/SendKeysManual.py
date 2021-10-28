import pyautogui
import os


# os.environ['DISPLAY'] = ':0'

def send_esc_key():
    """
    Works on Windows/Mac/Linux
    """
    pyautogui.press('esc')  # Presses esc
    # pyautogui.keyDown('esc')
    # pyautogui.keyUp('esc')
    pyautogui.press('escape')
    # pyautogui.hotkey('ctrl', 'shift', 'esc') #Performs ctrl+shift+esc
    # pyautogui.typewrite('Hello world!\n', interval=secs_between_keys)  #Useful for entering text, newline is Enter
    # pyautogui.typewrite(['a', 'b', 'c', 'left', 'backspace', 'enter', 'f1'], interval=.4) #A list of key names can be passed too
