module UI
  private

  # @param week_index [Integer] The index of the week (row) in the calendar grid
  # @param day_index [Integer] The index of the day (column) in the calendar grid
  # @param day_text [Integer, nil] The day number to display; if nil, the cell is empty
  # @param contents: [{}]
  # @options contents {}:
  # @option text (mandatory): [String] The text content to display inside the day square
  # @option date (mandatory): [Date] The date associated with the day square
  # @option text_options: [Hash] Additional text options for rendering the content
  # @return [void]
  def draw_day_square(week_index, day_index, day_text, contents = [{}])
    return unless day_text

    pdf.grid([week_index, day_index], [week_index, day_index]).bounding_box do
      pdf.stroke_bounds

      # Day number in a fixed 15x15 box at the top-left
      pdf.text_box day_text.to_s,
        at: [0, pdf.bounds.height],
        height: 15, width: 15, size: 8,
        align: :center, valign: :center

      # Move the flowing cursor below the day number box
      pdf.move_down 20

      # One call per line — no explicit "\n"
      option = { size: 6, indent_paragraphs: 10 }
      Array(contents).each do |content|
        # pdf.text content[:text], content.fetch(:text_options, {}).merge(option)
        pdf.text content, option
      end
    end
  end

  def draw_header(month)
    pdf.rectangle [0, pdf.bounds.height + 0.5.in], pdf.bounds.width, 0.5.in
    pdf.text_box month,
                 at: [0, pdf.bounds.height + 0.5.in],
                 width: pdf.bounds.width,
                 height: 0.25.in,
                 align: :center,
                 valign: :center

    weekdays = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
    weekdays.each_with_index do |weekday, index|
      width = pdf.bounds.width / 7
      left = width * index
      pdf.rectangle [left, pdf.bounds.height + 0.25.in], width, 0.25.in
      pdf.text_box weekday,
                   at: [left, pdf.bounds.height + 0.23.in],
                   height: 15,
                   width: width,
                   size: 8,
                   align: :center,
                   valign: :center
    end
  end

  def draw_notes(row, nil_cells, lines_distance)
    return if nil_cells[:count].zero?

    pdf.grid([row, nil_cells[:start]],
             [row, nil_cells[:start] + nil_cells[:count] - 1]).bounding_box do
      pdf.stroke_bounds

      pdf.draw_text "Notes",
                     at: [10, pdf.bounds.height - 12],
                     size: 5

      starting_line_top = 10
      line_position_increment = lines_distance == :close ? 17 : 22

      4.times do |i|
        top = starting_line_top + (i * line_position_increment)
        pdf.line [10, top],
                 [pdf.bounds.width - 10, top]
      end
    end
  end
end
