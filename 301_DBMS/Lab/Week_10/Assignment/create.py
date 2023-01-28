import streamlit as st
from database import add_data


def create():
    col1, col2, col3 = st.columns(3)
    with col1:
        train_no = st.text_input("Train number: ")
        train_source = st.text_input("Src: ")
    with col2:
        train_name = st.text_input("Train Name: ")
        train_destination = st.text_input("Dest: ")
    with col3:
        train_type = st.text_input("Train Type: ")
        train_availability = st.text_input("Availability: ")
    if st.button("Add Train"):
        add_data(train_no, train_name, train_type, train_source, train_destination, train_availability)
        st.success("Successfully added Train: {}".format(train_no))
