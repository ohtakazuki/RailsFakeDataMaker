module ApplicationHelper
  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "Fake Data Maker"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  # Fakerのクラス配列を返す
  def faker_list
    @faker_list ||= Faker.constants.select {|c| Faker.const_get(c).is_a? Class}
  end

end
