import datetime

import pandas as pd
import streamlit as st
from database import view_all_data, view_only_train_names, get_train, edit_train_data


def update():
    result = view_all_data()
    df = pd.DataFrame(result, columns = ['train_no', 'train_name', 'train_type', 'train_source', 'train_destination','train_availability'])
    with st.expander("Existing Trains"):
        st.dataframe(df)
    list_of_trains = [i[0] for i in view_only_train_names()]
    train = st.selectbox("Train to Edit", list_of_trains)
    result = get_train(train)
    if result:
        train_no = result[0][0]
        train_name = result[0][1]
        train_type = result[0][2]
        train_source = result[0][3]
        train_destination = result[0][4]
        train_availability = result[0][5]

        
        col1, col2, col3 = st.columns(3)
        with col1:
            new_train_no = st.text_input("Train No:", train_no)
            new_train_name = st.text_input("Train Name:", train_name)
        with col2:
            new_train_type = st.selectbox("Train Type", train_type)
            new_train_source = st.text_input("Train Src:", train_source)
        with col3:
            new_train_destination = st.text_input("Train Dest:", train_destination)
            new_train_availability = st.text_input("Train Availability",train_availability)
        if st.button("Update Train"):
            edit_train_data(new_train_no, new_train_name, new_train_type, new_train_source, new_train_destination, new_train_availability, train_no, train_name, train_type, train_source, train_destination,train_availability)
            st.success("Successful updation:: {} to ::{}".format(train_name, new_train_name))

    result2 = view_all_data()
    df2 = pd.DataFrame(result2, columns=['train_no', 'train_name', 'train_type', 'train_source',' train_destination','train_availability'])
    with st.expander("Updated table"):
        st.dataframe(df2)
