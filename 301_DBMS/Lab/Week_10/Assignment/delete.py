import pandas as pd
import streamlit as st
from database import view_all_data, view_only_train_names, delete_data


def delete():
    result = view_all_data()
    df = pd.DataFrame(result, columns = ['train_no', 'train_name', 'train_type', 'train_source',' train_destination','train_availability'])
    with st.expander("Curr data"):
        st.dataframe(df)

    list_of_trains = [i[0] for i in view_only_train_names()]
    selected_train = st.selectbox("Delete: ", list_of_trains)
    st.warning("Do you want to delete ::{}".format(selected_train))
    if st.button("Delete Train"):
        delete_data(selected_train)
        st.success("Train has been deleted successfully")
    new_result = view_all_data()
    df2 = pd.DataFrame(new_result, columns=['train_no', 'train_name', 'train_type', 'train_source',' train_destination','train_availability'])
    with st.expander("Updated data"):
        st.dataframe(df2)