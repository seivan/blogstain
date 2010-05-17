# lib/tasks/populate.rake
namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'
    [User, Content].each(&:delete_all)
    10.times do
      u = User.new(:username  =>  Faker::Internet.user_name,
                  :email      =>  Faker::Internet.email,
                  :password   =>  Faker::Name.name,
                  #:role       =>  "guest"
                  )
      u.role = "guest"
      u.save
    end
    10.times do
      u = User.new(:username  =>  Faker::Internet.user_name,
                  :email      =>  Faker::Internet.email,
                  :password   =>  Faker::Name.name,
                  #:role       =>  "user"
                  )
      u.role = "user"
      u.save
    end
    
    admin = User.new(:username => "Seivan", :email => "seivan@kth.se", :password => "asdasdasd")#, :role => "admin")
    admin.role = "admin"
    admin.save
    admin.reload# = User.find_by_role("admin")
    
    blog = Page.new(:title => "Blog", :published => true, :commented => false)#, :user_id => admin.id)
    blog.user_id = admin.id
    blog.save
    
    90.times do
      p = Post.new(:title => Faker::Company.bs,
                  :body => Faker::Lorem.paragraphs,
                  :published => true,
                  :commented => true,
                  #:user_id => admin.id,
                  )
      p.user_id = admin.id
      p.save
    end
    
    Post.all.each do |x|
      x.body = "New body updated should be visible" if rand(2)
      x.save
    end
    10.times do
      p = Post.new(:title => Faker::Company.bs,
                  :body => Faker::Lorem.paragraphs,
                  :published => false,
                  :commented => true,
                  #:user_id => admin.id,
                  )
      p.user_id = admin.id
      p.save
    end    
    
    3.times do |x|
      p = Page.new(:title => Faker::Company.bs,
                  :body => Faker::Lorem.paragraphs,
                  :published => true,
                  :commented => true,
                  :line_order => x
                  #:user_id => admin.id,
                  )
      p.user_id = admin.id
      p.save
    end
    
  end
end