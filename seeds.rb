require 'pry-byebug'

require_relative 'models/member'

rocky = Member.new ({
  'first_name' => 'Rocky',
  'second_name' => 'Balboa',
  'membership_tier' => 'Premium'
  })
  rock.save()

  lincoln = Member.new ({
    'first_name' => 'Lincoln',
    'second_name' => 'Hawk',
    'membership_tier' => 'Standard'
    })
    lincoln.save()

    john = Member.new({
      'first_name' => 'John',
      'second_name' => 'Matrix',
      'membership_tier' => 'Premium'
      })
      john.save()

      gi_jane = Member.new({
        'first_name' => 'Jordan',
        'second_name' => 'O\'Neill',
        'membership_tier' => 'Premium'
        })
        gi_jane.save()

        taggart = Member.new({
          'first_name' => 'Jim',
          'second_name' => 'Taggart',
          'membership_tier' => 'Standard'
          })
          taggart.save()

          lara = Member.new({
            'first_name' => 'Lara',
            'second_name' => 'Croft',
            'membership_tier' => 'Standard'
            })
            lara.save()

            
            binding.pry
            NIL
