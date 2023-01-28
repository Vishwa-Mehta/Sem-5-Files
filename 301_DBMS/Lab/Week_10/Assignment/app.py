# import mysql.connector
# mydb = mysql.connector.connect(
#     host = "localhost",
#     user = "root",
#     password = ""
# )
# c = mydb.cursor()

# c.execute("CREATE DATABASE lab10_pes2ug20cs389")


import streamlit as st

from create import create
from database import create_table
from delete import delete
from read import read
from update import update


def main():
    st.title("Train Database")
    menu = ["Add Train", "View Train", "Edit Train", "Remove Train"]
    choice = st.sidebar.selectbox("Menu", menu)

    create_table()
    if choice == "Add Train":
        st.subheader("Enter Train Details Below:")
        create()

    elif choice == "View Train":
        st.subheader("View Trains:")
        read()

    elif choice == "Edit Train":
        st.subheader("Update Existing Trains:")
        update()

    elif choice == "Remove Train":
        st.subheader("Delete Existing Trains:")
        delete()

    else:
        st.subheader("About tasks")


if __name__ == '__main__':
    main()
