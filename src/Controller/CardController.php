<?php

namespace App\Controller;

use App\Entity\Card;
use App\Form\CardType;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class CardController extends AbstractController
{
    /**
     * @Route("/card", name="card")
     * @param Request $request
     * @return \Symfony\Component\HttpFoundation\Response
     */


    public function card(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $card = new Card();
        $formCard = $this->createForm(CardType::class, $card);

        $cards = $em->getRepository(Card::class)->findAll();
        $formCard->HandleRequest($request);
        if ($formCard->isSubmitted() && $formCard->isValid()) {
            $image = $formCard->get('image')->getData();

            $imageName = 'card-'.uniqid().'.'.$image->guessExtension();
            $image->move(
                $this->getParameter('cards_folder'),
                $imageName
            );
            $card->setImage($imageName);
            $card->setCreator($this->getUser());
            $em->persist($card);
            $em->flush();
        }
        return $this->render('card/index.html.twig', [
            "cards" => $cards,
            "form" => $formCard->createView()
        ]);
    }


}
