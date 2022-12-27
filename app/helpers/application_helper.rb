module ApplicationHelper
  # SOURCE: https://stackoverflow.com/questions/18010120/how-to-embed-youtube-videos-into-a-rails-app-dynamically
  def video_embed(video_url)
    # REGEX EXTRACT VIDEO ID
    regex_id = /(?:youtube(?:-nocookie)?\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?)\/|\S*?[?&]v=)|youtu\.be\/|vimeo\.com\/)([a-zA-Z0-9_-]{8,11})/
    match_id = regex_id.match(video_url)
    video_id = ""
    if match_id && !match_id[1].blank?
      video_id = match_id[1]
    end

    # REGEX EXTRACT PROVIDER - YOUTUBE OR VIMEO
    regex_prov = /(youtube|youtu\.be|vimeo)/
    match_prov = regex_prov.match(video_url)
    video_prov = ""
    if match_prov && !match_prov[1].blank?
      video_prov = case match_prov[1]
                     when "youtube"
                       :youtube
                     when "youtu.be"
                       :youtube
                     when "vimeo"
                       :vimeo
      end
    end

    case video_prov
      when :youtube
        "https://www.youtube.com/embed/#{video_id}"
      when :vimeo
        "https://player.vimeo.com/video/#{video_id}"
    end
  end

  def job_url(job_slug)
    if params[:custom] == true
      "#{request.base_url + request.path}#{job_slug}"
    elsif params[:organization_slug]
      "#{request.base_url + request.path}/#{job_slug}"
    end
  end
end
