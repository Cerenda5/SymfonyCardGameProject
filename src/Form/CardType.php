<?php

namespace App\Form;

use App\Entity\Card;
use App\Entity\Faction;
use Doctrine\ORM\Mapping\Entity;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\File;

class CardType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name')
            ->add('attack')
            ->add('life')
            ->add('faction', EntityType::class, [
                'class' => Faction::class,
                'choice_label' => 'factionName'
            ])
            ->add('image', FileType::class, [
                'mapped' => false,
                'required' => false,
                 'constraints' => [
                     new File([
                         'maxSize' => '1024k',
                         'mimeTypes' => [
                             'image/png',
                             'image/jpg',
                         ],
                         'mimeTypesMessage' => 'Please upload a valid Image document',
                     ])
                 ],
            ])
            ->add('add', SubmitType::class, [
                'label' => 'Create Card',
                'attr' => [
                    'class' => 'btn btn-primary'
                ]
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Card::class,
        ]);
    }
}
