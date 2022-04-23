

class OnBoardingModel {

  final String title;
  final String image;
  final String description;

  OnBoardingModel({
    required this.title,
    required this.image,
    required this.description
  });

}

List<OnBoardingModel> onBoardingInfo = [
  OnBoardingModel(
    title: "Elige tu ubicación",
    image: "assets/resources/on_boarding/ubicacion.gif",
    description: "Elige tu ubicación donde llevaremos tu pedido, no olvides poner la infomación adicional  de tu domicilio.",
  ),
  OnBoardingModel(
    title: "Haz tu pedido",
    image: "assets/resources/on_boarding/compras.gif",
    description: "Una vez realices tu pedido nosotros nos encargaremos de enviártelo y que llegue justo a tus manos.",
  ),
  OnBoardingModel(
    title: "Pedido en camino",
    image: "assets/resources/on_boarding/camion.gif",
    description: "No te preocupes, te avisaremos cuando tu pedido esté en camino y justo antes de llegar.",
  ),
  OnBoardingModel(
    title: "Recibiste tu pedido!",
    image: "assets/resources/on_boarding/compras.gif",
    description: "Cuando te entreguemos tu pedido puedes revisarlo y confirmarlo.",
  ),
];