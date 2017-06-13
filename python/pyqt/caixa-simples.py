#!/usr/bin/env python                 
# -*- coding: iso-8859-1 -*-          
#                                     
# Simples Diálogo em PyQt4
#
import sys
from PyQt4.QtCore import *
from PyQt4.QtGui import *
 
class Form(QDialog):
 
    def __init__(self, parent=None):
        super(Form, self).__init__(parent)
 
        #...
 
 
if __name__ == "__main__":
    # cria o objeto aplicativo
    app = QApplication(sys.argv)
    # cria o dialogo
    dlg = Form()
    # executa o dialogo
    dlg.exec_()
