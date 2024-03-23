def parse_invoices(invoice_data)

  pattern = /(\d{4}-\d{2}-\d{2}) - (\w+) - ([\w\s]+) - (\$\d+)/

  invoice_data.each_line do |line|

  invoice_match = line.match(pattern)

    if invoice_match

      date = invoice_match[1]
      invoice_number = invoice_match[2]
      client = invoice_match[3]
      amount = invoice_match[4]

      puts "Date: #{date}, Invoice Number: #{invoice_number}, Client: #{client}, Amount: #{amount}"

    else

      puts "Invalid format: #{line}"

    end
  end
end

invoice_entries = <<-INVOICES
2023-03-01 - INV001 - Acme Corp - $1000
2023-03-02 - INV002 - Beta LLC - $2050
2023-03-03 - INV003 - Gamma Inc - $3500
INVOICES

parse_invoices(invoice_entries)
