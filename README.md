# 資料庫期末專題文件
###### tags: `CSIE課程`

## 應用場景 
### 髮廊管理系統💇🏻‍♀️

## 文件說明

- `Program Language`: **python3**
- `Database Language`: **mysql**
- `GUI Implement`: **Qt Designer**

## 介面
- 整體介面截圖 ：
    - ![](https://i.imgur.com/sPzBbTJ.png)
## 功能說明區塊說明
### 區塊1 : SQL語法輸入
- 可執行動作
    - SELECT 
    - UPDATE
    - DELETE
    - INSERT
    - ALTER
- 範例
    - ![](https://i.imgur.com/BuDOHjR.png)
### 區塊2
#### 一般功能區
- 該區塊主要用來++查詢設計師、客人的預約狀況++與++預約剪髮++
- ![](https://i.imgur.com/kpe0C6l.png)
- 預約列表按鈕
    - 查詢設計師目前預約狀況
    
    ```mysql
    sql = select salon_no, customer_phone, salon_content 
        from order_salon where designer_no = select_designer_no
    ```
- 預約狀況按鈕
    - 查詢客人目前預約狀況
    ```mysql
    sql = select salon_no, designer_no, salon_content 
        from order_salon 
        where customer_phone = select_customer_phone
    ```
- 預約美髮
    - 根據選擇的設計師、選擇的美髮項目、客人電話來預約美髮
    ```mysql
    sql = insert into order_salon 
        (salon_content, salon_price, customer_phone, designer_no) 
        values (%s, %s, %s, %s)
    ```


#### 管理預約總表區
- 該區塊主要用來管理預約總表
- ![](https://i.imgur.com/beM2TWw.png)
- 顯示預約總表按鈕
    - 如文字所述
    ```mysql
    sql = select * from order_salon
    ```
- 刪除按鈕
    - 刪除指定的預約編號
    ```mysql
    sql = delete from order_salon where salon_no =  select_salon_no
    ```
- 更新按鈕
    - 更新指定的預約編號的美髮項目
    ```mysql
    sql = update order_salon set salon_content = salon_content , 
        salon_price = price_dic[salon_content] 
        where salon_no = select_salon_no
    ```

#### 進階功能
- 該區塊主要用來執行一些特別功能
- ![](https://i.imgur.com/0GT1TCk.png)
- 總店預約狀況按鈕
    - 顯示總店的預約人數、平均花費、最小花費、最大花費、花費總金額
    ```mysql
    sql = select count(*),avg(salon_price),min(salon_price),max(salon_price),sum(salon_price) 
    from order_salon where designer_no 
    in (select designer_no from designer where office_addr = 'Happy Street No.1')
    ```
- 其他門市預約狀況
    - 顯示分店的預約人數、平均花費、最小花費、最大花費、花費總金額
    ```mysql
    sql = select office_addr, count(*),avg(salon_price),min(salon_price),max(salon_price),sum(salon_price)
          from order_salon ,designer where order_salon.designer_no = designer.designer_no and order_salon.designer_no 
          not in (select designer_no from designer where office_addr = 'Happy Street No.1') group by office_addr
    ```
- 非管理員設計師
    - 如文字所述
    ```mysql
    sql = select * from designer a where not exists (select manager_no from office where a.designer_no = manager_no)
    ```
- 庫存不足的耗材
    - 顯示庫存數量小於10的耗材名稱
    ```mysql
    sql = select * from item  group by item_no having item_num < 10 order by item_num
    ```
### 區塊3 : sql語法結果顯示區
- Feature:
    - 欄位會隨 SELECT 所選的attribute 順序做更動
    - 欄位會根據 SELECT 所選的attribute 轉換成中文欄位

## ER diagram
- ![](https://i.imgur.com/P41Ld8R.png)
## 第三正規化後的 Relation Schema
- ![](https://i.imgur.com/wuZUnpC.png)
- 說明意義和關係
    1. 顧客：
        - 透過「預約」動作來預約美髮。
    2. 設計師：
        - 與預約美髮總表的關係為「服務」，藉由美髮總表來服務客人，透過就職門市地址當作FK得知每間門市的設計師人員。
    3. 預約美髮總表
        - 透過預約者電話與設計師編號當作FK來得知目前的預約狀況。
    4. 門市：
        - 透過設計師編號當作FK用來得知管理該門市是哪位設計師。
    6. 耗材
        - 紀錄耗材的數量以便補貨，同時透過設計師編號當作FK用來得知管理該耗材是哪位設計師。



