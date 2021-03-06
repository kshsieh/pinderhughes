FactoryGirl.define do 
  factory :blog do
    title "Laid-Off Man Finally Achieves Perfect Work-Life Balance"

    entry "IRVINE, CA—Just two weeks after being laid off from the tech firm 
          where he worked as a coder, 34-year-old Sam Morrison told sources 
          Monday that he had finally achieved the perfect work-life balance. 
          “It’s been great; this new schedule allows me to spend more time with
           my wife and kids, get together with friends, and I can even squeeze 
           in a few hours of TV here and there—I’ve finally found the mix of 
           career and personal life that works for me,” explained the stress-
           free man, who credited the shift to helping him get on a regular 
           sleep cycle and workout regimen for the first time in years. 
           “Lately I’m feeling less overwhelmed, I’m more upbeat, and I’m 
           finally writing again. It’s really all about having good time management.” 
           As of press time, Morrison was doing yoga in his backyard as his mortgage 
           payment became overdue."

    sequence(:user_id) {|n| "#{n}"}
  end
  
  factory :invalid_blog, parent: :blog do
    title ''
    entry ''
    user_id ''
  end
end