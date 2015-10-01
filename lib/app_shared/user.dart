part of app.shared;

class User extends Model {
  @Field('first_name') String firstName;
  @Field('last_name') String lastName;
  @field String password;
  @field String email;
}
