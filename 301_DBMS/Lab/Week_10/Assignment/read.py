import pandas as pd
import streamlit as st
import plotly.express as px
from database import view_all_data


def read():
    result = view_all_data()
    df = pd.DataFrame(result, columns = ['train_no', 'train_name', 'train_type', 'train_source', 'train_destination','train_availability'])
    with st.expander("View All Trains"):
        st.dataframe(df)
    with st.expander("Train Location"):
        task = df['train_source'].value_counts().to_frame()
        task = task.reset_index()
        st.dataframe(task)
        plt = px.pie(task, names = 'index', values = 'train_source')
        st.plotly_chart(plt)