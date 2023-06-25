module ApplicationHelper
  def page_title(page_title = '')
    base_title = 'Sunkissing'
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def default_meta_tags
    {
      site: 'Sunkissing',
      title: 'Sunkissing | 日焼け止めの塗り直し通知アプリ',
      description: '適切なタイミングで塗り直しを行うことで、あなたの肌を紫外線から守りましょう。',
      reverse: true,
      charset: 'utf-8',
      keywords: '日焼け止め, 塗り直し, 通知アプリ, 紫外線, スキンケア, UVプロテクション, 日差し, 太陽, 夏, SPF, PA',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('sunkissing_logo.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@sunkissing_app',
        image: image_url('sunkissing_logo.png')
      }
    }
  end
end
