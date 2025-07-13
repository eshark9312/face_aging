# Face Aging Application

A deep learning application that can age faces in images and create aging videos using a UNet model. This application provides three main features:

- **Face Aging**: Transform a face from one age to another
- **Aging Video**: Create a smooth transition video between ages
- **Aging Timelapse**: Generate a timelapse showing progression through multiple ages

## Features

- 🖼️ **Image Aging**: Upload an image and specify source/target ages
- 🎥 **Video Generation**: Create smooth aging transition videos
- ⏱️ **Timelapse**: Generate aging progression through multiple age points
- 🎯 **Precise Control**: Adjustable age ranges (10-90 years)
- 📱 **Web Interface**: User-friendly Gradio interface

## Prerequisites

- Windows 10/11
- Python 3.12
- At least 4GB RAM
- Internet connection for model download

## Installation Steps

### 1. Install Miniconda

Download and install Miniconda from the official website:
- Visit: https://docs.conda.io/en/latest/miniconda.html
- Download the Windows 64-bit installer
- Run the installer and follow the setup wizard
- **Important**: During installation, check "Add Miniconda3 to my PATH environment variable"

### 2. Enable Conda Environment (PowerShell)

Open PowerShell as Administrator and run:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

This command allows conda to execute scripts and manage environments.

### 3. Initialize Conda

Open a new PowerShell window and run:

```powershell
conda init powershell
```

Close and reopen PowerShell for the changes to take effect.

### 4. Install Required Dependencies

Navigate to the project directory and install the required packages:

```powershell
# Create and activate a new conda environment
conda create -n face_aging python=3.12 -y
conda activate face_aging

# Install PyTorch CPU version
pip install torch==2.3.1+cpu torchvision==0.18.1+cpu -f https://download.pytorch.org/whl/cpu/torch_stable.html

# Install the custom dlib wheel (included in the project)
pip install dlib-19.24.99-cp312-cp312-win_amd64.whl

# Install remaining requirements
pip install -r requirements.txt
```

### 5. Run the Application

```powershell
python app.py
```

The application will:
- Download the pre-trained model (~100MB) on first run
- Start a local web server
- Open the interface in your default browser at `http://localhost:7860`

## Usage

### Face Aging
1. Upload an image of a person
2. Set the current age using the slider
3. Set the target age using the slider
4. Click "Submit" to generate the aged image

### Aging Video
1. Upload an image
2. Set source and target ages
3. Adjust duration and FPS settings
4. Generate a smooth transition video

### Aging Timelapse
1. Upload an image
2. Set the current age
3. Generate a timelapse showing progression through multiple ages

## Troubleshooting

### Common Issues

**PowerShell Execution Policy Error:**
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

**Conda not recognized:**
- Restart PowerShell after conda init
- Ensure Miniconda is added to PATH during installation

**dlib Installation Error:**
- Use the provided wheel file: `dlib-19.24.99-cp312-cp312-win_amd64.whl`
- Ensure you're using Python 3.12

**Model Download Issues:**
- Check internet connection
- The model will download automatically on first run
- Model size: ~100MB

### System Requirements

- **OS**: Windows 10/11
- **Python**: 3.12
- **RAM**: 4GB minimum, 8GB recommended
- **Storage**: 500MB free space
- **GPU**: Not required (CPU-only version)

## Project Structure

```
Face-Aging/
├── app.py                          # Main application file
├── models.py                       # UNet model definition
├── test_functions.py              # Image processing functions
├── requirements.txt               # Python dependencies
├── dlib-19.24.99-cp312-cp312-win_amd64.whl  # Custom dlib wheel
├── examples/                      # Sample images
│   ├── girl.jpg
│   ├── man.jpg
│   └── trump.jpg
└── README.md                      # This file
```

## Technical Details

- **Model**: UNet architecture for face aging
- **Framework**: PyTorch (CPU version)
- **Interface**: Gradio web interface
- **Face Detection**: dlib and face-recognition libraries
- **Video Processing**: Integration with Face-Morphing API

## License

MIT License - see LICENSE file for details.

## Support

If you encounter any issues during installation or usage, please:
1. Check the troubleshooting section above
2. Ensure all prerequisites are met
3. Verify you're using the correct Python version (3.12)
4. Check that all dependencies are properly installed

## Acknowledgments

- Model trained on face aging datasets
- Uses Hugging Face Hub for model distribution
- Built with Gradio for the web interface
