import streamlit as st
import os
import sys
import subprocess

st.set_page_config(page_title="My Streamlit App", layout="wide")

def main():
    st.title("Simple Streamlit App")

    env_var = os.getenv('MY_ENV_VAR', 'Default Value')
    st.write(f"Environment Variable MY_ENV_VAR: {env_var}")