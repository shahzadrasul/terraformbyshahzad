from PIL import Image
import io
import boto3, os

# Create a new PIL image from the image_data:
image = Image.open(image_data)

# We need to use the orientation EXIF info to rotate the image:
image_exif = image.getexif()
if image_exif:
  exif = dict(image_exif.items())
  if exif.get(orientation) == 3:
    image = image.rotate(180, expand=True)
  elif exif.get(orientation) == 6:
    image = image.rotate(270, expand=True)
  elif exif.get(orientation) == 8:
    image = image.rotate(90, expand=True)

# Retrieve the image contents as a list representing a sequence of pixel values:
image_contents = list(image.getdata())

# Create a new image based on the original, but without the full EXIF data:
new_image = Image.new(image.mode, image.size)
new_image.putdata(image_contents)

# Finally, create a new buffer object and put the new image file data into it:
new_image_data = io.BytesIO()
new_image.save(new_image_data, 'PNG') # Or the file format needed
new_image_data.seek(0)

def handler(event):

  s3 = boto3.client('s3')


  file_path = event['Records'][0]['s3']['object']['key']


  file_name, file_extension = os.path.splitext(file_path)


  if file_extension.lower() not in ['.jpg', '.png', '.jpeg']:
    return

  tagging = s3.get_object_tagging(Bucket='bucket_a', Key=file_path)
  object_tags = tagging['TagSet']

  for tag in object_tags:
    if tag['Key'] == 'ExifStripped' and tag['Value'] == 'True':
      return


  image_data = s3.get_object(Bucket='bucket_a', Key=file_path)


  s3.put_object(Bucket='bucket_a', Key=file_path, Body=new_image_data, Tagging='ExifStripped=True')