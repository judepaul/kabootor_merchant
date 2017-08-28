
module ImageDataUtils
  require 'fileutils'
  
  def convert_image_data_uri_to_image(user_type, img_data, archival_id)
    if user_type==USER_TYPE_VISITOR
      directory_name = POSTER_IMAGE_VISITOR_DIRECTORY
    else
      directory_name = POSTER_IMAGE_REGISTERED_DIRECTORY
    end
    Dir.mkdir(directory_name) unless File.exists?(directory_name)
    file_name = "#{archival_id}.png"
    image_data = Base64.decode64(img_data['data:image/png;base64,'.length .. -1])
    new_file=File.new("#{directory_name}/#{file_name}", 'wb')
    new_file.write(image_data)
    return file_name
  end
end