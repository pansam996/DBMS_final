import sys
from GUI import Ui_MainWindow
from PyQt5 import QtWidgets, QtCore
from PyQt5.QtWidgets import QApplication, QMainWindow


class MainWindow(QMainWindow, Ui_MainWindow):

  def __init__(self, parent=None):
    super(MainWindow, self).__init__(parent)
    self.setupUi(self)
    self.onBindingUI()


  def printData(self):
    _translate = QtCore.QCoreApplication.translate
    # 表格數量宣告
    self.tableWidget.setColumnCount(100)
    self.tableWidget.setRowCount(100)

    # 橫列
    item = QtWidgets.QTableWidgetItem()
    self.tableWidget.setHorizontalHeaderItem(10, item)
    item.setText(_translate("MainWindow", "xx"))

    # 縱列
    item = QtWidgets.QTableWidgetItem()
    self.tableWidget.setVerticalHeaderItem(2, item)
    item.setText(_translate("MainWindow", "xx"))

    # 表格內填值
    item = QtWidgets.QTableWidgetItem()
    self.tableWidget.setItem(0, 3, item)
    item = self.tableWidget.item(0, 3)
    item.setText(_translate("MainWindow", "QQQQ"))
  def onBindingUI(self):
    pass
if __name__ == '__main__':
  app = QApplication(sys.argv)
  application = MainWindow()
  application.show()
  sys.exit(app.exec_())

# # Connect MySQL
# import mysql.connector
# mbdb = mysql.connector.connect(
#   host = "127.0.0.1",
#   user = "root",
#   password = "dbms2020",
#   database = "mb_hair"
#   )
# cursor=mbdb.cursor()

# # sql = "create table "
# # cursor.execute(sql)
