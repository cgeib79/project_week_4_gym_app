require 'pry-byebug'

require_relative 'models/member'
require_relative 'models/fitness_class'

rocky = Member.new ({
  'first_name' => 'Rocky',
  'second_name' => 'Balboa',
  'membership_tier' => 'Premium'
  })
  rocky.save()

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

            tyler = Member.new({
              'first_name' => 'Tyler',
              'second_name' => 'Durden',
              'membership_tier' => 'Premium'
              })
              tyler.save()

            bruiser = Fitness_Class.new({
              'class_name' => 'Taskforce Bruiser',
              'class_time' => '07:00',
              'peak_category' => 'off-peak',
              'max_class_size' => 5
              })
              bruiser.save()

            red_dawn = Fitness_Class.new({
              'class_name' => 'Red Dawn',
              'class_time' => '05:00',
              'peak_category' => 'off-peak',
              'max_class_size' => 6
              })
              red_dawn.save()

              close = Fitness_Class.new({
                'class_name' => 'They are really close',
                'class_time' => '12:00',
                'peak_category' => 'peak',
                'max_class_size' => 7
                })
                close.save()

                fight = Fitness_Class.new({
                  'class_name' => 'Fight Club',
                  'class_time' => '18:00',
                  'peak_category' => 'peak',
                  'max_class_size' => 8
                  })
                  fight.save()

                  black_eye = Fitness_Class.new({
                    'class_name' => 'Black Eye Friday',
                    'class_time' => '19:00',
                    'peak_category' => 'peak',
                    'max_class_size' => 8
                    })
                    black_eye.save()

            binding.pry
            NIL
