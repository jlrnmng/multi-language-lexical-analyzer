# Multi-Language Lexical Analyzer

**Author**: Johnlerein B. Manaog  
**Program**: BSCS 3A

##  Description

This project is a lexical analyzer capable of parsing multiple programming languages. It uses Flex (Fast Lexical Analyzer Generator) to tokenize input source code, and features a GUI interface built with Python.

## 🛠 Requirements

Ensure you have the following installed:

- [MSYS2](https://www.msys2.org/)
- `flex` (via MSYS2: `pacman -S flex`)
- `gcc` (via MSYS2: `pacman -S gcc`)
- Python 3 (for the GUI)
- VS Code (with MSYS2 integration or terminal support)

## Project Structure

```
multi-language-lexical-analyzer/
├── lexer.l       # Flex definition file
├── main.c        # Main C file
├── Makefile      # Build instructions
├── gui.py        # Python GUI interface
└── lexer.exe     # Compiled executable (optional)
```

## ⚙️ Setup Instructions (Using MSYS2 in VS Code)

1. **Open VS Code**
   - Use `File > Open Folder` and select `multi-language-lexical-analyzer/`.

2. **Open MSYS2 Terminal in VS Code**
   - Open a new terminal (`Ctrl + ``)
   - Use the dropdown to select the MSYS2 environment (or manually open the terminal and `cd` into the project folder)

3. **Install Dependencies (First Time Only)**
   ```bash
   pacman -Syu     # Update system
   pacman -S flex gcc make
   ```

4. **Build the Lexer**
   ```bash
   make
   ```

   This compiles `lexer.l` and `main.c` into `lexer.exe`.

5. **Run the GUI**
   ```bash
   python gui.py
   ```

   The GUI will allow you to select a file and analyze its tokens using the lexer.

##  Clean Up

To remove compiled files:

```bash
make clean
```

---

Feel free to modify or extend this analyzer to support additional languages or integrate further analysis features.
