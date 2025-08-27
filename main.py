import streamlit as st
import os
import sys
import subprocess

st.set_page_config(page_title="My Streamlit App", layout="wide")

def main():
    st.title("Simple Streamlit App")

    env_var = os.getenv('MY_ENV_VAR', 'Default Value')
    st.write(f"Environment Variable MY_ENV_VAR: {env_var}")

if __name__ == "__main__":
    if 'STREAMLIT_RUN' not in os.environ:
        os.environ['STREAMLIT_RUN'] = '1'
        subprocess.Popen([sys.executable, "-m", "streamlit", "run", __file__, "--server.headless", "true", "--server.port", "8501"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        print("Streamlit app started at http://localhost:8501")
    else:
        main()