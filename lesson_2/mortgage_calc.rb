def prompt(message)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input && input > '0'
end

def float?(input)
  input.to_f.to_s == input && input > '0'
end

def valid_number(input)
  integer?(input) || float?(input)
end

prompt('Welcome to your mortgage calculator!')
prompt('------------------------------------')

loop do
  loan_amount = ''
  loop do
    prompt('How much is the loan?')
    loan_amount = gets.chomp

    if valid_number(loan_amount)
      break
    else
      prompt('Please enter a valid number')
    end
  end

  loan_length = ''
  loop do
    prompt('How long is your loan in years?')
    loan_length = gets.chomp

    if valid_number(loan_length)
      break
    else
      prompt('Please enter the length of the loan in years')
    end
  end

  apr = ''
  loop do
    prompt('What is your APR?')
    apr = gets.chomp

    if valid_number(apr)
      break
    else
      prompt('Please enter a valid number for your APR.')
    end
  end

  loan_duration_months = loan_length.to_i * 12
  monthly_int_rate = ((apr.to_f / 100) / 12)

  monthly_payment = loan_amount.to_f *
                    (monthly_int_rate /
                    (1 - (1 + monthly_int_rate)**(-loan_duration_months)))

  prompt("You're monthly payment is: $#{format('%.2f', monthly_payment)}")

  prompt('Press "Y" if you would like to recalculate.')
  answer = gets.chomp.downcase

  break unless answer == 'y'
end

prompt('Thank you for using the Mortgage Calculator!')
