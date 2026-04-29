# FAQs

## Who are the trainers and who are the clients?

Use:

users.role

Values:
- trainer
- client
- admin

Extra details stored in:

trainer_profiles
client_profiles

## What plans or coaching programs exist?

Use:

coaching_plans

Fields:
- name
- description
- duration_weeks
- price

## Which client purchased which plan?

Use:

subscriptions

Join:

client_profiles.id = subscriptions.client_id

coaching_plans.id = subscriptions.plan_id

## When does a client’s plan start and end?

Use:

subscriptions.start_date
subscriptions.end_date

## Are there consultations or sessions being scheduled?

Use:

sessions

Fields:
- scheduled_at
- meeting_link
- status

## Are clients submitting check-ins weekly?

Use:

check_ins

Track by:

submitted_at

## How is progress being tracked?

Use:

progress_logs

Fields:
- weight
- chest
- waist
- hips
- arms
- thighs
- logged_at

## Can multiple clients enroll in the same program?

Yes.

Relationship:

coaching_plans 1:N subscriptions

## Can one trainer handle many clients?

Yes.

Relationship:

trainer_profiles 1:N client_profiles

## How should payment and subscription information be stored?

Subscriptions:

subscriptions

Payments:

payments

Join:

subscriptions.id = payments.subscription_id
