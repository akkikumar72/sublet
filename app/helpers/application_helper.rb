module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_text_for_space_requtes(space_request)
    "Looking for #{space_request.size} SQFT in #{space_request.city}"
  end

  def get_custom_black_colored_class_for_size(min_size, max_size, params_q)
    if params_q.present?
      if params_q["size_gteq"] == min_size and params_q["size_lteq"] == max_size
        "color:black; border-bottom: none !important;"
      end
    end
  end

  def get_custom_black_colored_class_for_price(min_size, max_size, params_q)
    if params_q.present?
      if params_q["price_gteq"] == min_size and params_q["price_lteq"] == max_size
        "color:black; border-bottom: none !important;"
      end
    end
  end

end

