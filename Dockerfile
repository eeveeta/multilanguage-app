# First stage: Python for data preprocessing
FROM python:3.9 AS python-part
WORKDIR /python-part
COPY python-part/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY python-part/preprocess.py ./
COPY python-part/input.csv ./
RUN python3 preprocess.py input.csv

# Second stage: R for data analysis
FROM r-base:4.1.0 AS r-part
WORKDIR /r-part
COPY r-part/Rrequirements.R ./
RUN Rscript --vanilla Rrequirements.R
COPY --from=python-part /python-part/cleaned_data.csv ./
COPY r-part/analyze.R ./
RUN Rscript --vanilla analyze.R cleaned_data.csv

# Final stage: Copy output from both stages
FROM ubuntu:20.04
COPY --from=python-part /python-part/cleaned_data.csv /app/
COPY --from=r-part /r-part/analyze_output.txt /app/

