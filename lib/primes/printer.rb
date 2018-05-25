module Primes
  class Printer
    def self.table_as_string(table)
      cell_size = (table.last * table.last).to_s.length + 2
      output = "#{_first_row(table, cell_size)}\n"
      table.each_with_index do |_, row|
        output += _first_column_of_row(table, row, cell_size)
        table.each_with_index { |_, col| output += _val_at_row_col(table, row, col, cell_size)}
        output += "\n"
      end
      output
    end

    private_class_method

    def self._first_row(table, cell_size = 8)
      first_row = ' ' * cell_size
      table.each { |p| first_row += p.to_s.center(cell_size) }
      first_row
    end

    def self._first_column_of_row(table, row, cell_size = 8)
      table[row].to_s.ljust(cell_size - 1) + ' '
    end

    def self._val_at_row_col(table, row, col, cell_size = 8)
      row_val = table[row]
      col_val = table[col]
      (row_val * col_val).to_s.rjust(cell_size - 1) + ' '
    end
  end
end
