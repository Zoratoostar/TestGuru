# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def id(model, params)
  model.where(params).pluck(:id).first
end

Role.create!([
  { name: 'Администратор' },
  { name: 'Пользователь' }
])

User.create!([
  { name: 'Alexey Mekhonoshin',
    email: 'alexey.mekhonoshin@mail.org',
    role_id: id(Role, name: 'Пользователь') },

  { name: 'Svetlana Ivanova',
    email: 'svetlana.ivanova@mail.org',
    role_id: id(Role, name: 'Пользователь') },

  { name: 'Aleksandr Titiov',
    email: 'aleksandr.titov@mail.org',
    role_id: id(Role, name: 'Администратор') }
])

Category.create!([
  { title: 'Основы веб-разработки' },
  { title: 'Биология' },
  { title: 'Ruby' }
])

Test.create!([
  { title: 'Основы HTML',
    level: 0,
    category_id: id(Category, title: 'Основы веб-разработки') },

  { title: 'Основы CSS',
    level: 0,
    category_id: id(Category, title: 'Основы веб-разработки') },

  { title: 'Флора для самых маленьких',
    level: 0,
    category_id: id(Category, title: 'Биология') },

  { title: 'Фауна для самых маленьких',
    level: 0,
    category_id: id(Category, title: 'Биология') },

  { title: 'Фауна Байкала',
    level: 3,
    category_id: id(Category, title: 'Биология') },

  { title: 'Модели и ассоциации в Ruby on Rails',
    level: 2,
    category_id: id(Category, title: 'Ruby') },

  { title: 'Контроллеры в Ruby on Rails',
    level: 1,
    category_id: id(Category, title: 'Ruby') },
])

Question.create!([
  # Вопросы для "Основы CSS"
  { body: 'Задайте цвет тексту: <span>Я - Текст</span>',
    test_id: id(Test, title: 'Основы CSS') },

  { body: 'Отцентруйте текст по вертикали: <table><td>Текст1</td><td>Текст<br>2</td></table>',
    test_id: id(Test, title: 'Основы CSS') },

  { body: 'В чём разница между class и id?',
    test_id: id(Test, title: 'Основы CSS') },

  # Вопросы для "Основы HTML"
  { body: 'Создайте POST-форму для ввода пароля и эл.почты.',
    test_id: id(Test, title: 'Основы HTML') },

  { body: 'Что означают теги HTML, HEAD, BODY?',
    test_id: id(Test, title: 'Основы HTML') },

  { body: 'Зачем нужен тег <q>?',
    test_id: id(Test, title: 'Основы HTML') },

  # Вопросы для "Флора для самых маленьких"
  { body: 'Что изучает флора?',
    test_id: id(Test, title: 'Флора для самых маленьких') },

  # Вопросы для "Фауна для самых маленьких"
  { body: 'Выберите предcтавителя фауны: гвоздика, собака',
    test_id: id(Test, title: 'Флора для самых маленьких') },

  # Вопросы для "Фауна Байкала"
  { body: 'Кто не является представителем подводного мира оз.Байкал: нерпа, нарвал, осётр',
    test_id: id(Test, title: 'Фауна Байкала') },

  { body: 'Перечислите минимум три вида птиц, живущих территории Байкала',
    test_id: id(Test, title: 'Фауна Байкала') },

  # Вопросы для "Модели и ассоциации в Ruby on Rails"
  { body: 'Опишите разницу между ассоциациями has_many и has_one',
    test_id: id(Test, title: 'Модели и ассоциации в Ruby on Rails') },

  { body: 'Составьте классы для сущностей: user, book. Отношение между сущностями - многие-ко-многим.',
    test_id: id(Test, title: 'Модели и ассоциации в Ruby on Rails') },

  # Вопросы для "Контроллеры в Ruby on Rails"
  { body: 'Опишите соглашение об именовании контроллеров',
    test_id: id(Test, title: 'Контроллеры в Ruby on Rails') },

  { body: 'Зачем нужны strong-параметры?',
    test_id: id(Test, title: 'Контроллеры в Ruby on Rails') }
])

# Answer.create!([
#   { user_id: id(User, email: 'alexey.mekhonoshin@mail.org'),
#     question_id: id(Question, body: 'Опишите соглашение об именовании контроллеров'),
#     given_option: 'A',
#     correctness: true },
#
#   { user_id: id(User, email: 'alexey.mekhonoshin@mail.org'),
#     question_id: id(Question, body: 'Что означают теги HTML, HEAD, BODY?'),
#     given_option: 'B',
#     correctness: false },
#
#   { user_id: id(User, email: 'svetlana.ivanova@mail.org'),
#     question_id: id(Question, body: 'Кто не является представителем подводного мира оз.Байкал: нерпа, нарвал, осётр'),
#     given_option: 'B',
#     correctness: false },
#
#   { user_id: id(User, email: 'svetlana.ivanova@mail.org'),
#     question_id: id(Question, body: 'Задайте цвет тексту: <span>Я - Текст</span>'),
#     given_option: 'A',
#     correctness: true }
# ])

Evaluation.create!([
  { user_id: id(User, email: 'alexey.mekhonoshin@mail.org'),
    test_id: id(Test, title: 'Контроллеры в Ruby on Rails'),
    started_at: Time.now },

  { user_id: id(User, email: 'alexey.mekhonoshin@mail.org'),
    test_id: id(Test, title: 'Основы HTML'),
    started_at: Time.now },

  { user_id: id(User, email: 'svetlana.ivanova@mail.org'),
    test_id: id(Test, title: 'Фауна Байкала'),
    started_at: Time.now },

  { user_id: id(User, email: 'svetlana.ivanova@mail.org'),
    test_id: id(Test, title: 'Основы CSS'),
    started_at: Time.now }
])
