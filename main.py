import streamlit as st
import os

st.title("Simple Streamlit App")

env_var = os.getenv('MY_ENV_VAR', 'Default Value')
st.write(f"Environment Variable MY_ENV_VAR: {env_var}")
