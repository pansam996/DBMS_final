import sys
import mysql.connector
from GUI import Ui_MainWindow
from PyQt5 import QtWidgets, QtCore
from PyQt5.QtWidgets import QApplication, QMainWindow


# Connect MySQL
mb_db = mysql.connector.connect(
    host="127.0.0.1",
    user="root",
    password="dbms2020",
    database="mb_hair"
)
cursor = mb_db.cursor()


class MainWindow(QMainWindow, Ui_MainWindow):
    def __init__(self, parent=None):
        super(MainWindow, self).__init__(parent)
        self.setupUi(self)
        self.on_binding_ui()

    def on_binding_ui(self):
        self.pushButton.clicked.connect(self.sql_enter)
        self.pushButton_2.clicked.connect(self.sql_clear)
        self.pushButton_5.clicked.connect(self.designer_list)
        self.pushButton_3.clicked.connect(self.customer_order_list)
        self.pushButton_4.clicked.connect(self.show_order_list)
        self.pushButton_6.clicked.connect(self.order_list_delete)
        self.pushButton_25.clicked.connect(self.order_list_update)
        self.pushButton_13.clicked.connect(self.head_office_order)
        self.pushButton_11.clicked.connect(self.each_office_member_num)
        self.pushButton_12.clicked.connect(self.each_office_manager)
        self.pushButton_9.clicked.connect(self.inventory_shortage_item)

    def inventory_shortage_item(self):
        pass

    def each_office_manager(self):
        pass

    def each_office_member_num(self):
        pass

    def head_office_order(self):
        pass

    def order_list_update(self):
        pass

    def order_list_delete(self):
        pass

    def show_order_list(self):
        pass

    def customer_order(self):
        pass

    def customer_order_list(self):
        pass

    def designer_list(self):
        pass

    def sql_clear(self):
        _translate = QtCore.QCoreApplication.translate
        self.label_22.setText(_translate("MainWindow", ''))
        self.textEdit.clear()
        self.tableWidget.setColumnCount(0)
        self.tableWidget.setRowCount(0)

    def sql_enter(self):
        _translate = QtCore.QCoreApplication.translate

        table_dic = {'designer': {'designer_no': '設計師編號', 'name': '設計師姓名',
                                  'phone': '設計師電話', 'office_address': '就職門市地址'},
                     'customer': {'phone': '電話', 'name': '姓名', 'birthday': '生日'},
                     'office': {'office_address': '門市地址', 'phone': '門市電話',
                                'size': '門市坪數', 'manager_no': '管理人編號'},
                     'item': {'item_no': '耗材編號', 'item_name': '耗材名稱',
                              'item_num': '耗材數量', 'manager_no': '管理人編號'},
                     'order_salon': {'salon_no': '預約編號', 'salon_content': '美髮項目',
                                     'salon_price': '美髮價錢', 'customer_phone': '預約者電話', 'designer_no': '設計師編號'}}
        action_dic = {'select': '查詢成功',
                      'insert': '新增成功',
                      'delete': '刪除成功',
                      'update': '更新成功',
                      'alter': '更改成功',

                      'create': '創造成功',
                      'drop': '刪除成功'}
        '''
        refresh table
        select x,x,x from T where
        update T set x,x,x
        delete from T
        insert into T
        alter table T
        
        without refresh table
        drop table <- 刪除成功即可
        create table T <- 創造成功即可
        '''

        sql = str(self.textEdit.toPlainText())
        try:
            cursor.execute(sql)
            if sql == '':
                self.label_22.setText(_translate("MainWindow", "請輸入SQL語法"))
                self.tableWidget.setColumnCount(0)
                self.tableWidget.setRowCount(0)

            else:
                action = sql.split()[0]

                drop_create = ['drop', 'create']
                if action in drop_create:
                    self.label_22.setText(_translate("MainWindow", action_dic[action]))
                    self.tableWidget.setColumnCount(0)
                    self.tableWidget.setRowCount(0)

                else:
                    self.label_22.setText(_translate("MainWindow", action_dic[action]))
                    # find table name
                    sql_item = sql.split()
                    table_index = 0
                    table_key_words = ['from', 'into', 'update', 'table']
                    for _ in sql_item:
                        if _ in table_key_words:
                            table_index = sql_item.index(_)
                            break

                    table = sql_item[table_index+1]

                    # print after action's data
                    column_count = 1
                    if action != 'select':
                        sql = 'select * from ' + table
                        cursor.execute(sql)
                        result = cursor.fetchall()
                        try:
                            column_count = len(table_dic[table])
                            self.tableWidget.setColumnCount(column_count)
                            # set column value
                            column_value = []
                            for k, v in table_dic[table].items():
                                column_value.append(v)
                            print(column_value)
                            for i in range(column_count):
                                item = QtWidgets.QTableWidgetItem()
                                self.tableWidget.setHorizontalHeaderItem(i, item)
                                item.setText(_translate("MainWindow", column_value[i]))
                        except KeyError:
                            if result:
                                column_count = len(result[0])
                            self.tableWidget.setColumnCount(column_count)
                    else:
                        if sql_item[1] == '*':
                            result = cursor.fetchall()
                            try:
                                column_count = len(table_dic[table])
                                self.tableWidget.setColumnCount(column_count)
                                # set column value
                                column_value = []
                                for k, v in table_dic[table].items():
                                    column_value.append(v)
                                for i in range(column_count):
                                    item = QtWidgets.QTableWidgetItem()
                                    self.tableWidget.setHorizontalHeaderItem(i, item)
                                    item.setText(_translate("MainWindow", column_value[i]))
                            except KeyError:
                                if result:
                                    column_count = len(result[0])
                                self.tableWidget.setColumnCount(column_count)
                        else:
                            result = cursor.fetchall()
                            # set column value
                            '''
                            select x from
                            select x,x,x from
                            '''
                            column_value = sql_item[1]
                            column_value = column_value.split(',')
                            column_count = len(column_value)
                            self.tableWidget.setColumnCount(column_count)
                            try:
                                column_dic = table_dic[table]
                                for i in range(column_count):
                                    item = QtWidgets.QTableWidgetItem()
                                    self.tableWidget.setHorizontalHeaderItem(i, item)
                                    item.setText(_translate("MainWindow", column_dic[column_value[i]]))
                            except KeyError:
                                for i in range(column_count):
                                    item = QtWidgets.QTableWidgetItem()
                                    self.tableWidget.setHorizontalHeaderItem(i, item)
                                    item.setText(_translate("MainWindow", column_value[i]))

                    row_count = len(result)
                    self.tableWidget.setRowCount(row_count)

                    # set row value
                    for i in range(row_count):
                        item = QtWidgets.QTableWidgetItem()
                        self.tableWidget.setVerticalHeaderItem(i, item)
                        item.setText(_translate("MainWindow", str(i+1)))

                    # set item value
                    for i in range(row_count):
                        for j in range(column_count):
                            item = QtWidgets.QTableWidgetItem()
                            self.tableWidget.setItem(i, j, item)
                            item = self.tableWidget.item(i, j)
                            item.setText(_translate("MainWindow", str(result[i][j])))
                    # update db
                    mb_db.commit()

        except mysql.connector.errors.ProgrammingError as e:
            self.tableWidget.setColumnCount(0)
            self.tableWidget.setRowCount(0)
            self.label_22.setText(_translate("MainWindow", str(e).split(';')[0]))
        except mysql.connector.errors.IntegrityError as e:
            self.tableWidget.setColumnCount(0)
            self.tableWidget.setRowCount(0)
            self.label_22.setText(_translate("MainWindow", str(e).split(';')[0]))

    def print_data(self):
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


if __name__ == '__main__':
    app = QApplication(sys.argv)
    application = MainWindow()
    application.show()
    sys.exit(app.exec_())


