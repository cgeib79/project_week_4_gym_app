require 'pry-byebug'

require_relative 'models/member'
require_relative 'models/fitness_class'
require_relative 'models/member_class'

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
              'fitness_class_name' => 'Taskforce Bruiser',
              'fitness_class_time' => '07:00',
              'peak_category' => 'off-peak',
              'fitness_class_max_size' => 5
              })
              bruiser.save()

            red_dawn = Fitness_Class.new({
              'fitness_class_name' => 'Red Dawn',
              'fitness_class_time' => '05:00',
              'peak_category' => 'off-peak',
              'fitness_class_max_size' => 6
              })
              red_dawn.save()

              fight = Fitness_Class.new({
                'fitness_class_name' => 'Fight Club',
                'fitness_class_time' => '18:00',
                'peak_category' => 'peak',
                'fitness_class_max_size' => 8
                })
                fight.save()

                full_metal = Fitness_Class.new({
                  'fitness_class_name' => 'Sergeant Hartman memorial drill',
                  'fitness_class_time' => '12:30',
                  'peak_category' => 'peak',
                  'fitness_class_max_size' => 9
                  })
                  full_metal.save()

                  black_eye = Fitness_Class.new({
                    'fitness_class_name' => 'Black Eye Friday',
                    'fitness_class_time' => '19:00',
                    'peak_category' => 'peak',
                    'fitness_class_max_size' => 8
                    })
                    black_eye.save()

member_class1 =
Member_Class.new({
  'member_id' => rocky.id,
  'fitness_class_id' => fight.id
  })
member_class1.save()

member_class2 =
Member_Class.new({
  'member_id' => tyler.id,
  'fitness_class_id' => bruiser.id
  })
member_class2.save()

            binding.pry
            nil
