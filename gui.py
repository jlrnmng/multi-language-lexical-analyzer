import tkinter as tk
from tkinter import ttk, scrolledtext, messagebox
import subprocess
import tempfile
import os

# Function to run lexer
def run_lexer():
    lang = language_var.get()
    if lang not in ["c", "python", "java"]:
        messagebox.showerror("Invalid Language", "Please select a valid language.")
        return

    source_code = code_input.get("1.0", tk.END).strip()
    if not source_code:
        messagebox.showerror("Empty Input", "Please enter some source code.")
        return

    with tempfile.NamedTemporaryFile(delete=False, mode='w', suffix='.txt') as tmp:
        tmp.write(source_code)
        tmp_path = tmp.name

    try:
        result = subprocess.run(["./lexer", lang, tmp_path], capture_output=True, text=True)
        output_display.config(state='normal')
        output_display.delete("1.0", tk.END)
        output_display.insert(tk.END, result.stdout if result.returncode == 0 else result.stderr)
        output_display.config(state='disabled')
    finally:
        os.remove(tmp_path)

# GUI Setup
window = tk.Tk()
window.title("Multi-Language Lexical Analyzer")
window.geometry("800x600")
window.configure(bg='#f0f4f7')

style = ttk.Style()
style.configure("TLabel", background="#f0f4f7", font=("Helvetica", 11))
style.configure("TButton", font=("Helvetica", 11, "bold"))
style.configure("TCombobox", font=("Helvetica", 11))

# Language Selection
ttk.Label(window, text="Select Programming Language:").pack(pady=(15, 5))
language_var = tk.StringVar()
language_menu = ttk.Combobox(window, textvariable=language_var, values=["c", "python", "java"], state="readonly")
language_menu.current(0)
language_menu.pack()

# Code Input Area
ttk.Label(window, text="Enter Source Code:").pack(pady=(15, 5))
code_input = scrolledtext.ScrolledText(window, width=90, height=12, font=("Consolas", 11))
code_input.pack(pady=(0, 10))

# Run Button
run_button = ttk.Button(window, text="Run Lexer", command=run_lexer)
run_button.pack(pady=10)

# Output Area
ttk.Label(window, text="Lexer Output:").pack(pady=(20, 5))
output_display = scrolledtext.ScrolledText(window, width=90, height=12, font=("Consolas", 11), state='disabled', bg="#e6f2ff")
output_display.pack(pady=(0, 20))

window.mainloop()
