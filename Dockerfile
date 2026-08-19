FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Install FFmpeg and clean up apt cache to prevent cross-device link errors
RUN apt-get update && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy ONLY requirements first to leverage Docker layer caching
COPY requirements.txt /app/

# Install Python dependencies without storing the pip cache
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application files from the current directory
COPY . /app/

# Command to run your Python script
CMD ["python3", "bot.py"]
